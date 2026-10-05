package board.service;

import java.util.List;

public interface BoardService {

    List<BoardVO> selectBoardList();
    BoardVO selectBoardDetail(BoardVO boardVO);
    int insertBoard(BoardVO boardVO);
    int updateBoard(BoardVO boardVO);
    int deleteBoard(int boardNo);
}
