<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="board-detail">
    <form id="updateForm">
        <input type="hidden" name="boardNo" value="${boardNo}">

        <div class="detail-head">
            <div class="detail-title">
                <input type="text" id="title" name="title" maxlength="200">
            </div>
        </div>

        <div class="detail-writer">
            <span id="userNickname"></span>
            <span class="detail-user-id">(<span id="userId"></span>)</span>
        </div>

        <textarea class="detail-content" id="content" name="content"></textarea>

        <div class="detail-btn-area">
            <button type="button" id="btnCancel">취소</button>
            <button type="button" id="btnSave">저장</button>
        </div>
    </form>
</div>

<script>
const boardNo = ${boardNo};

    $(function () {
        selectBoardDetail();

        $('#title').focus();

        $('#btnCancel').on("click", function() {
            if(confirm("게시글 수정을 취소하시겠습니까?")) {
                location.href = '${pageContext.request.contextPath}/board/selectBoardDetailView.do?boardNo=${boardNo}';
            } else {
                return;
            }
        })

        $('#btnSave').on("click", function() {
            updateBoard();
        })
    })

    function selectBoardDetail() {
        $.ajax({
            url: '${pageContext.request.contextPath}/board/selectBoardDetail.do',
            type: 'GET',
            data: {
                boardNo: boardNo
            },
            dataType: 'json',
            success: function(res) {
                $('#title').val(res.title);
                $('#regDttm').text(res.regDttm);
                $('#userNickname').text(res.nickname);
                $('#userId').text(res.userId);
                $('#content').val(res.content);
            }
        });
    }

    function updateBoard() {
        const title = $("#title").val().trim();

        if(!title) {
            alert("제목을 입력해 주세요");
            $('#title').focus();
            return;
        }

        if(confirm("수정하시겠습니까?")) {

            let data = $('#updateForm').serializeArray();

            $.ajax({
                url:'${pageContext.request.contextPath}/board/updateBoard.do',
                type: 'POST',
                data: data,
                success: function(res) {
                    if(res > 0) {
                        alert("게시글이 수정되었습니다");
                        location.href = '${pageContext.request.contextPath}/board/selectBoardDetailView.do?boardNo=${boardNo}';
                    } else {
                        alert("게시글 수정 실패하였습니다");
                    }
                }
            })
        } else {
            return;
        }
    }
</script>
