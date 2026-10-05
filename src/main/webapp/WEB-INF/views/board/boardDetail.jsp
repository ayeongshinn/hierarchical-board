<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div class="board-detail">
    <form id="detailForm" method="post">
        <div class="detail-head">
            <div class="detail-title" id="title"></div>
            <div class="detail-date" id="regDttm"></div>
        </div>

        <div class="detail-viewCnt">
            조회수 <span id="viewCnt"></span>
        </div>

        <div class="detail-writer">
            <span id="userNickname"></span>
            <span class="detail-user-id">(<span id="userId"></span>)</span>
        </div>

        <div class="detail-content" id="content"></div>
        <div class="detail-btn-area">
            <button type="button" id="btnReply">답글</button>
            <button type="button" id="btnUpdate">수정</button>
            <button type="button" id="btnDelete">삭제</button>
        </div>

        <div class="detail-comment-head">
            <span>댓글</span>
            <span>(<span id="commentCount">0</span>)</span>
        </div>
    </form>
    <div id="commentList" class="comment-list"></div>

</div>
</body>
</html>
<script>
const boardNo = ${boardNo};

    $(function () {
        selectBoardDetail();

        $('#btnUpdate').on("click", function() {
            location.href = '${pageContext.request.contextPath}/board/updateBoardView.do?boardNo=${boardNo}';
        })

        $('#btnDelete').on("click", function() {
            deleteBoard();
        })
    })

    function selectBoardDetail() {
        $.ajax({
            url: '${pageContext.request.contextPath}/board/selectBoardDetail.do',
            type: 'GET',
            data: { boardNo : boardNo },
            dataType: 'json',
            success: function(res) {
                if(res) {
                    $('#title').text(res.title);
                    $('#regDttm').text(res.regDttm);
                    $('#userNickname').text(res.nickname);
                    $('#viewCnt').text(res.viewCnt);
                    $('#userId').text(res.userId);
                    $('#content').text(res.content);
                }
            }
        })
    }

    function deleteBoard() {

        if(confirm("삭제하시겠습니까?")) {
            $.ajax({
                url: '${pageContext.request.contextPath}/board/deleteBoard.do',
                type: 'POST',
                data: { boardNo : boardNo },
                success: function(res) {
                    if(res > 0) {
                        alert("게시글이 삭제되었습니다");
                        location.href = '${pageContext.request.contextPath}/board/selectBoardView.do';
                    } else {
                        alert("게시글 삭제 실패하였습니다");
                    }
                }
            })
        } else {
            return;
        }
    }

</script>
