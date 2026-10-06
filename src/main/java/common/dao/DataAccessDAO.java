package common.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DataAccessDAO {

    private final SqlSession sqlSession;

    public DataAccessDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }
    public <T> List<T> list(String queryId) {
        return sqlSession.selectList(queryId);
    }

    public <T> List<T> list(String queryId, Object param) {
        return sqlSession.selectList(queryId, param);
    }

    public <T> T selectOne(String queryId) {
        return sqlSession.selectOne(queryId);
    }

    public <T> T selectOne(String queryId, Object param) {
        return sqlSession.selectOne(queryId, param);
    }

    public int insert(String queryId, Object param) {
        return sqlSession.insert(queryId, param);
    }

    public int update(String queryId, Object param) {
        return sqlSession.update(queryId, param);
    }
}
