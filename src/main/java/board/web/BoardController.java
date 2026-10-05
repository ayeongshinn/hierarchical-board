package board.web;

import board.service.BoardService;
import board.service.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    /**
     * 게시판 목록 화면
     */
    @GetMapping("/selectBoardView.do")
    public String boardList() {
        return "board/board";
    }

    /**
     * 게시판 목록 조회
     */
    @GetMapping("/selectBoardList.do")
    @ResponseBody
    public List<BoardVO> selectBoardList() {
        return boardService.selectBoardList();
    }

    /**
     * 게시글 상세 화면
     */
    @GetMapping("/boardDetailView.do")
    public String selectBoardDetailView(BoardVO boardVO, Model model) {
        model.addAttribute("boardNo", boardVO.getBoardNo());
        return "board/boardDetail";
    }

    /**
     * 게시글 상세 조회
     * @param boardVO
     * @return
     */
    @GetMapping("/selectBoardDetail.do")
    @ResponseBody
    public BoardVO selectBoardDetail(BoardVO boardVO) {
        return boardService.selectBoardDetail(boardVO);
    }

    /**
     * 게시글 등록 화면
     * @return
     */
    @GetMapping("/boardInsertView.do")
    public String insertBoardView() {
        return "board/boardInsert";
    }

    /**
     * 게시글 등록
     * @param boardVO
     * @return
     */
    @PostMapping("/insertBoard.do")
    @ResponseBody
    public int insertBoard(BoardVO boardVO) {
        return boardService.insertBoard(boardVO);
    }

    /**
     * 게시글 수정 화면
     * @param boardVO
     * @param model
     * @return
     */
    @GetMapping("/updateBoardView.do")
    public String updateBoardView(BoardVO boardVO, Model model) {
        model.addAttribute("boardNo", boardVO.getBoardNo());
        return "board/boardUpdate";
    }

    /**
     * 게시글 수정
     * @param boardVO
     * @return
     */
    @PostMapping("/updateBoard.do")
    @ResponseBody
    public int updateBoard(BoardVO boardVO) {
        return boardService.updateBoard(boardVO);
    }

    /**
     * 게시글 삭제
     * @param boardNo
     * @return
     */
    @PostMapping("/deleteBoard.do")
    @ResponseBody
    public int deleteBoard(int boardNo) {
        System.out.println("삭제 boardNo = " + boardNo);
        return boardService.deleteBoard(boardNo);
    }

}
