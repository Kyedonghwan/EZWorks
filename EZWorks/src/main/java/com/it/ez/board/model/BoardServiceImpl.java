package com.it.ez.board.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.it.ez.emp.model.EmpDAO;
import com.it.ez.emp.model.EmpVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private final BoardDAO boardDao;
	private final EmpDAO empDao;
	
	@Override
	public List<BoardVO> selectAllBoard() {
		return boardDao.selectAllBoard();
	}

	@Override
	public BoardVO selectByBoardNo(int boardNo) {
		return boardDao.selectByBoardNo(boardNo);
	}

	@Override
	public List<BoardVO> selectByBoardType(String boardType) {
		return boardDao.selectByBoardType(boardType);
	}

	@Override
	public List<String> selectBoardAdmin(int boardNo) {
		List<Integer> list = boardDao.selectBoardAdmin(boardNo);
		List<String> namelist = new ArrayList<>();
		for(int a : list) {
			EmpVO vo = empDao.selectEmpByEmpNo(a);
			String name = vo.getEmpName();
			namelist.add(name);
		}
		return namelist;
	}

	@Override
	public int insertFavBoards(int boardNo, int empNo) {
		return boardDao.insertFavBoards(boardNo, empNo);
	}

	@Override
	public List<BoardVO> selectFavBoards(int empNo) {
		return boardDao.selectFavBoards(empNo);
	}

	@Override
	public int deleteFavBoards(int boardNo, int empNo) {
		return boardDao.deleteFavBoards(boardNo, empNo);
	}

	@Override
	public List<BoardVO> selectBoardByDeptNo(int deptNo) {
		return boardDao.selectBoardByDeptNo(deptNo);
	}
}
