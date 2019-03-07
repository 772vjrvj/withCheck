package com.hk.toCheckFinal.service;

import java.util.List;

import com.hk.toCheckFinal.dtos.HcChkDto;
import com.hk.toCheckFinal.dtos.HcCriteria;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;

public interface IHcService {

	//V아이디 체크
	public HcLoginDto idChk(String id);
	
	//V회원가입
	public boolean insertUser(HcLoginDto dto);
	
	//V아이디 찾기 
	public HcLoginDto findId(String name, String phone);
   
	//V비밀번호찾기 본인인증
	public HcLoginDto findPw(String id, String phone);
   
	//V비밀번호 찾기 아이디에 맞는 질문 가저오기
	public HcLoginDto findPw_find(String id);
   
	//V비밀번호찾기 질문에 일치하는 답변이지 검사해서 비밀번호 출력하기
	public HcLoginDto findPw_After(String question,String answer);
	
	//V로그인
	public HcLoginDto getLogin(String id, String password);	
   
	//V유저 정보 얻기
	public HcLoginDto getUser(String id);   
   
	//V기간이 종료되지 않은 모든 유저들의 리스트
	public List<HcDto> getAllListEvery();

	//V리스트 종료(삭제아님 날짜가 지난 리스트 종료)
	public boolean updateEndList(HcDto dto);	
	
	//V참가자 인원세기
	public int habitCalIntoPerCount(String intoper);

	//V습관달력 삭제
	public boolean habitCalDeleteAll(String pKey);	
	
	//V인증 페이지들 모두 삭제
	public boolean deleteHcInChkAll(String pKey); 	
		
	//V로그인한 유저 한명의 종료되지 않은 리스트
	public List<HcDto> getAllList(String id);
		
	//V습관달력 만들기 값 입력 habitCalInsert
	public boolean habitCalInsert(HcDto dto);
	
	//V참가한 사람 그 습관달력의 모든 기간에 대한 상세인증페이지 만들기
	public boolean insertHcInChk(HcInChkDto HcInChkDto);
	
	//Vsort업데이트 방금 본걸 main에서 맨 앞화면으로 보려고
	public boolean updateSort(String sort, String pKey);
	
	//V습관달력 한개 구하기
	public HcDto getHabitCalListOne(String pKey,String id);
	
	//VpKey가 같은 습관달력들 구하기
	public List<HcDto> getHabitCalList(String pKey);
		
	
	//V체크 값들 가저오기
	public List<String> habitCalTakeChk(String pKey);	
	
	//V체크 삭제하기
	public boolean habitCalChkDelete(String pKey,String chk);
	
	//V체크 값 세기
	public int habitCalChkCount(String pKey);	
	
	//V체크 갯수 업데이트
	public boolean updateChkCount(HcDto HcDto);   
		
    //V체크 값 입력
	public boolean habitCalInsertChk(String pKey,String chk);

	//V혼자하기 공개 비공개 여부
	public boolean updateCalWith(HcDto dto);   
	
	//V습관달력 삭제
	public boolean habitCalDelete(String pKey,String id);

	//V해당 아이디 인증 페이지들 모두 삭제
	public boolean deleteHcInChk(String pKey,String id); 
		
	
	
	
	
	
	
	//V모든 회원들의 '혼자' 하기 리스트 보기
	public List<HcDto> getAllHcListAlone();
	
	//V모든 회원들의 '함께' 하기 리스트 보기
	public List<HcDto> getAllHcListWith();	
		
	public List<HcDto> listCriteriaAlone(HcCriteria cri);
	
	public List<HcDto> listCriteriaWith(HcCriteria cri);
		
	
	
	
	
	
	//V아이디 검색
	public List<HcDto> getSearchID(String searchId, String withh);
   
	//V제목 검색
	public List<HcDto> getSearchTitle(String searchTitle, String withh);
   
	//V기간 검색
	public List<HcDto> getSearchTerm(String searchTerm, String withh);

	//V시작일 검색
	public List<HcDto> getSearchStartDate(String searchStartDate, String withh);
	 	
	//V해당일 인증해야 하는 것들 다 가지고 오기	   
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto);

	//V인증값 가저오기
	public HcInChkDto getHcUserInChk(HcInChkDto HcInChkDto);	
	
	//V인증 사진 올리기
	public boolean updateHcInChk(HcInChkDto HcInChkDto);   

	//V인증삭제하기
	public boolean deleteHcUserInChk(HcInChkDto HcInChkDto);   

	//V랭킹
	public List<HcDto> boardlistWithRanking();
   	
	//V유저 정보 변경
	public boolean updateUser(HcLoginDto dto);
	
	//V탈퇴하기
	public boolean deleUser(String id);

	//V탈퇴한 아이디 리스트 지우기
	public boolean deleList(String id);

	//V종료일이 지난 모든 리스트들 가저오기
	public List<HcDto> getAllListEndY(String id);


   public List<HcLoginDto> getAllUser();
   public boolean updateRoleUser(String id, String role,String enabled);


}