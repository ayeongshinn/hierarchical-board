<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/board/board.css">
<html>
<body>
    <div class="board-list">
        <div class="board-row board-head">
            <div class="title">제목</div>
            <div class="userNo">작성자</div>
            <div class="regDttm">등록일자</div>
            <div class="viewCnt">조회수</div>
        </div>
        <div id="boardList"></div>
    </div>
</body>
<script>
    $(function() {
        selectBoardList();
    })

    // 게시글 목록 조회
    function selectBoardList() {
        $.ajax({
            url: '${pageContext.request.contextPath}/board/selectBoardList.do',
            type: 'GET',
            dataType: 'json',
            success: function(res) {

                $('#boardList').empty();

                let html = '';

                if(res.length > 0) {
                    $.each(res, function(index, item) {

                        html += '<div class="board-row">';
                        html += '   <div class="title">';
                        html += '       <a href=${pageContext.request.contextPath}/board/boardDetailView.do?boardNo=' + item.boardNo + ">" + item.title + '</a>';
                        html += '   </div>';
                        html += '   <div class="userNo">' + item.nickname + '</div>';
                        html += '   <div class="regDttm">' + item.regDttm + '</div>';
                        html += '   <div class="viewCnt">' + item.viewCnt + '</div>';
                        html += '</div>';
                    })
                } else {
                    html += '<div class="board-row">'
                    html += ' <div class="board-empty">등록된 게시글이 없습니다</div> '
                    html += '</div>'
                }

                $('#boardList').append(html);

            },
            error: function(xhr) {
                console.log(xhr);
            }
        })
    }

</script>
</html>