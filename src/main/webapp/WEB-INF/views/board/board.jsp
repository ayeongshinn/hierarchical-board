<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/board.css?v=<%= System.currentTimeMillis() %>">

<div class="board-list">
    <div class="search-section">
        <select id="searchCategory">
            <option>전체</option>
            <option value="title">제목</option>
            <option value="writer">작성자</option>
        </select>
        <input type="text" id="searchKeyword" placeholder="검색어를 입력하세요">
        <button type="button" id="searchBtn">검색</button>
    </div>
    <div class="board-row board-head">
        <div class="boardNo" style="text-align:center;">번호</div>
        <div class="title" style="text-align:center;">제목</div>
        <div class="userNo" style="text-align:center;">작성자</div>
        <div class="regDttm" style="text-align:center;">등록일자</div>
        <div class="viewCnt" style="text-align:center;">조회수</div>
    </div>
    <div id="boardList"></div>
    <div class="board-pagination"></div>
</div>

<script>
    $(function() {
        selectBoardList(1);

        // 페이징 버튼 클릭 이벤트
        $(document).on("click", ".page-btn", function() {
            const page = $(this).data("page");
            selectBoardList(page);
        })

        // 검색 버튼 클릭 이벤트
        $('#searchBtn').on("click", function() {
            selectBoardList(1);
        })

        // 엔터 시 검색되도록
        $('#searchKeyword').on('keydown', function(e) {
            if(e.key === 'Enter') {
                $('#searchBtn').click();
            }
        })
    })

    // 게시글 목록 조회
    function selectBoardList(currentPage) {

        const searchCategory = $('#searchCategory').val();
        const searchKeyword = $('#searchKeyword').val().trim();

        $.ajax({
            url: '${pageContext.request.contextPath}/board/selectBoardList.do',
            type: 'GET',
            data: {
                currentPage: currentPage,
                searchCategory: searchCategory,
                searchKeyword: searchKeyword
            },
            success: function(res) {

                $('#boardList').empty();

                let html = '';

                if(res.boardList.length > 0) {
                    $.each(res.boardList, function(index, item) {

                        html += '<div class="board-row">';
                        html += '   <div class="boardNo" style="text-align:center;">' + item.boardNo + '</div>';
                        html += '   <div class="title">';
                        html += '       <a href=${pageContext.request.contextPath}/board/selectBoardDetailView.do?boardNo=' + item.boardNo + ">" + item.title + '</a>';
                        html += '   </div>';
                        html += '   <div class="userNo" style="text-align:center;">' + item.nickname + '</div>';
                        html += '   <div class="regDttm" style="text-align:center;">' + item.regDt + '</div>';
                        html += '   <div class="viewCnt" style="text-align:center;">' + item.viewCnt + '</div>';
                        html += '</div>';
                    })
                } else {
                    html += '<div class="board-row">'
                    html += ' <div class="board-empty">등록된 게시글이 없습니다</div> '
                    html += '</div>'
                }

                $('#boardList').append(html);

                renderPagination(res.totalCnt, currentPage);
            },
            error: function(xhr) {
                console.log(xhr);
            }
        })
    }

    // 페이징
    function renderPagination(totalCnt, currentPage) {

        const perPage = 10;
        const totalPage = Math.ceil(totalCnt / perPage);

        console.log("perPage >> ", perPage, " totalPage >> ", totalPage, " currentPage >> ", currentPage);

        let html = '';

        for(let i = 1; i <= totalPage; i++) {
            if(i === currentPage) {
                html += '<button class="page-btn active" data-page="' + i +'">' + i + '</button>';
            } else {
                html += '<button class="page-btn" data-page="' + i + '">' + i + '</button>';
            }
        }

        $(".board-pagination").html(html);
    }

</script>