package com.wasp.chaser.persistence.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wasp.chaser.domain.EpisodeDTO;
import com.wasp.chaser.persistence.IEpisodeDAO;

@Repository
public class EpisodeDAOImpl implements IEpisodeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.wasp.chaser.episodeMapper";

	@Override
	public void insert(EpisodeDTO episode) throws Exception {
		sqlSession.insert(namespace + ".insert", episode);		
	}

	@Override
	public EpisodeDTO read(int episode_idx) throws Exception {
		return sqlSession.selectOne(namespace + ".read", episode_idx);
	}

	@Override
	public int update(EpisodeDTO episode) throws Exception {
		return sqlSession.update(namespace + ".update", episode);
	}

	@Override
	public int delete(int episode_idx) throws Exception {
		return sqlSession.delete(namespace + ".delete", episode_idx);
	}

	@Override
	public List<EpisodeDTO> listAll() throws Exception {
		return sqlSession.selectList(namespace + ".listAll");
	}

}
