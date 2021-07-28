package com.it.ez.form.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.ez.approval.model.ApprovalConstUtil;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class FormServiceImpl implements FormService{

	private final FormDAO formDao;
	
	@Override
	public List<FormVO> selectForm() {
		return formDao.selectForm();
	}

	@Override
	public List<String> selectFormFolder() {
		return formDao.selectFormFolder();
		
	}

	@Override
	public int insertUsedForm(Map<String, Object> map) {
		if(formDao.isDuplUsedForm(map)>0) {
			return ApprovalConstUtil.usedFormDisabled;
		}
		else {
			int cnt =formDao.insertUsedForm(map);
			return ApprovalConstUtil.usedFormAvailable;
		}
	}

	@Override
	public List<Map<String, Object>> showUsedForm(int empNo) {
		return formDao.showUsedForm(empNo);
	}

}
