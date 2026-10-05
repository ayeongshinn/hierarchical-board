<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="board-detail">

    <form id="insertForm">
        <!-- userNo 하드코딩 추후 수정할 것-->
        <input type="hidden" name="userNo" value="1">
        <div class="detail-head">
            <div class="detail-title">
                <input type="text" id="title" name="title" maxlength="200" placeholder="제목">
            </div>
        </div>

        <div class="detail-content">
            <textarea id="content" name="content" placeholder="내용을 입력해 주세요"></textarea>
        </div>

        <div class="detail-btn-area">
            <button type="button" id="btnCancel">취소</button>
            <button type="button" id="btnSave">등록</button>
        </div>

    </form>

</div>

<script>
    $(function() {
        $('#btnCancel').on('click', function() {
            location.href = '${pageContext.request.contextPath}/board/selectBoardView.do';
        });

        $('#btnSave').on('click', function() {
            insertBoard();
        });
    });

    function insertBoard() {
        const title = $('#title').val().trim();
        const content = $('#content').val().trim();

        if (!title) {
            alert('제목을 입력해 주세요');
            $('#title').focus();
            return;
        }

        if (!content) {
            alert('내용을 입력해 주세요');
            $('#content').focus();
            return;
        }

        if(confirm("게시글을 등록하시겠습니까?")) {

            const data = $('#insertForm').serialize();

            $.ajax({
                url: '${pageContext.request.contextPath}/board/insertBoard.do',
                type: 'POST',
                data: data,
                success: function(res) {
                    if (res > 0) {
                        alert('게시글이 등록되었습니다');
                        location.href = '${pageContext.request.contextPath}/board/selectBoardView.do';
                    } else {
                        alert('게시글 등록에 실패했습니다');
                    }
                }
            });
        }
    }
</script>