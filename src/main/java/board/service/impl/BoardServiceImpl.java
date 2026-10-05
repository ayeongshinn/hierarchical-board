package board.service.impl;

import board.service.BoardService;
import board.service.BoardVO;
import common.dao.DataAccessDAO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    private final DataAccessDAO dataAccessDAO;

    public BoardServiceImpl(DataAccessDAO dataAccessDAO) {
        this.dataAccessDAO = dataAccessDAO;
    }

    @Override
    public List<BoardVO> selectBoardList() {
        return dataAccessDAO.list("board.selectBoardList");
    }

    @Override
    public BoardVO selectBoardDetail(BoardVO boardVO) {
        dataAccessDAO.update("board.increaseViewCnt", boardVO);
        return dataAccessDAO.selectOne("board.selectBoardDetail", boardVO);
    }

    @Override
    public int insertBoard(BoardVO boardVO) {

        int res = dataAccessDAO.insert("board.insertBoard", boardVO);

        if(res > 0) {
            dataAccessDAO.update("board.updateBoardGroupNo", boardVO);
        }

        return res;
    }

    @Override
    public int updateBoard(BoardVO boardVO) {
        return dataAccessDAO.update("board.updateBoard", boardVO);
    }

    @Override
    public int deleteBoard(int boardNo) {
        return dataAccessDAO.update("board.deleteBoard", boardNo);
    }
}
