package com.hk.toCheckFinal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.toCheckFinal.daos.IHcDao;
import com.hk.toCheckFinal.dtos.HcChkDto;
import com.hk.toCheckFinal.dtos.HcDto;
import com.hk.toCheckFinal.dtos.HcInChkDto;
import com.hk.toCheckFinal.dtos.HcLoginDto;

@Service
public class HcServiceImp implements IHcService {

	//V
	@Autowired
	private IHcDao hcDao;   
   
	//V아이디체크
	@Override
	public HcLoginDto idChk(String id) {
		System.out.println("HcServiceImp idChk");
	   return hcDao.idChk(id);
	}
   
	//V회원가입
    @Override
    public boolean insertUser(HcLoginDto dto) {
		System.out.println("HcServiceImp insertUser");
    	return hcDao.insertUser(dto);
    }
    
    //V아이디 찾기 
    @Override
    public HcLoginDto findId(String name, String phone) {
    	System.out.println("HcServiceImp findId");
    	return hcDao.findId(name, phone);
    }

    //V비밀번호찾기 본인인증
    @Override
    public HcLoginDto findPw(String id, String phone) {
    	System.out.println("HcServiceImp findPw");
       return hcDao.findPw(id, phone);
    }
    
    //V비밀번호 찾기 아이디에 맞는 질문 가저오기
    @Override
    public HcLoginDto findPw_find(String id) {
    	System.out.println("HcServiceImp findPw_find");
    	return hcDao.findPw_find(id);
    }
    //V비밀번호찾기 질문에 일치하는 답변이지 검사해서 비밀번호 출력하기
    @Override
    public HcLoginDto findPw_After(String question,String answer) {
    	System.out.println("HcServiceImp findPw_After");    	
    	return hcDao.findPw_After(question, answer);
    }
    
    //V로그인
    @Override
    public HcLoginDto getLogin(String id, String password) {
		System.out.println("HcServiceImp getLogin");
    	return hcDao.getLogin(id, password);
    }
    
    //V유저정보얻기
    @Override
    public HcLoginDto getUser(String id) {
		System.out.println("HcServiceImp getUser");
    	return hcDao.getUser(id);
    }    
    
    //V기간이 종료되지 않은 모든 유저들의 리스트
    @Override
    public List<HcDto> getAllListEvery(){
    	System.out.println("HcServiceImp getAllListEvery");
 	   return hcDao.getAllListEvery();
    }
    
	//V리스트 종료(삭제아님 날짜가 지난 리스트 종료)
    @Override
    public boolean updateEndList(HcDto dto) {
    	System.out.println("HcServiceImp updateEndList");
    	return hcDao.updateEndList(dto);
    }    
    
	//V참가자 인원 받기
	@Override
	public int habitCalIntoPerCount(String intoper) {
    	System.out.println("HcServiceImp habitCalIntoPerCount");
		return hcDao.habitCalIntoPerCount(intoper);
	}
	
	//V습관달력 전부 삭제
	@Override
	public boolean habitCalDeleteAll(String pKey) {
    	System.out.println("HcServiceImp habitCalDeleteAll");		
		return hcDao.habitCalDeleteAll(pKey);
	}	
	
	//V인증 페이지들 모두 삭제
	@Override   
	public boolean deleteHcInChkAll(String pKey) {
    	System.out.println("HcServiceImp deleteHcInChkAll");				
		return hcDao.deleteHcInChkAll(pKey);		
	}	
	
    //V로그인한 유저 한명의 종료되지 않은 리스트
    @Override
    public List<HcDto> getAllList(String id) {
    	System.out.println("HcServiceImp getAllList");				
    	return hcDao.getAllList(id);
    }
	
	//V습관달력 만들기 값 입력 habitCalInsert
	@Override
	public boolean habitCalInsert(HcDto dto) {
    	System.out.println("HcServiceImp habitCalInsert");						
		return hcDao.habitCalInsert(dto);
	}	
	
	//V참가한 사람 그 습관달력의 모든 기간에 대한 상세인증페이지 만들기
	@Override
	public boolean insertHcInChk(HcInChkDto HcInChkDto) {
    	System.out.println("HcServiceImp insertHcInChk");						      
		return hcDao.insertHcInChk(HcInChkDto);
	}		
	
	//Vsort업데이트 방금 본걸 main에서 맨 앞화면으로 보려고
	@Override
	public boolean updateSort(String sort, String pKey) {
    	System.out.println("HcServiceImp updateSort");						      		
		return hcDao.updateSort(sort,pKey);
	}
	
	//V습관달력 한개 구하기
	@Override
	public HcDto getHabitCalListOne(String pKey,String id) {
    	System.out.println("HcServiceImp getHabitCalListOne");						      		
		return hcDao.getHabitCalListOne(pKey,id);
	}	

	//V체크 값들 가저오기
	@Override
	public List<String> habitCalTakeChk(String pKey){
    	System.out.println("HcServiceImp habitCalTakeChk");						      				
		return hcDao.habitCalTakeChk(pKey);
	}	
	
	//V체크 삭제하기
	@Override
	public boolean habitCalChkDelete(String pKey,String chk) {
    	System.out.println("HcServiceImp habitCalChkDelete");						      						
	      return hcDao.habitCalChkDelete(pKey,chk);
	}	
	
	//V체크 값 세기
    @Override
	public int habitCalChkCount(String pKey) {
    	System.out.println("HcServiceImp habitCalChkCount");						      						    	
    	return hcDao.habitCalChkCount(pKey);
    }	
	
	//V체크 갯수 업데이트
	public boolean updateChkCount(HcDto HcDto) {
    	System.out.println("HcServiceImp updateChkCount");						      						    			
		return hcDao.updateChkCount(HcDto);
	}	    
    
	//V체크 값 입력
	@Override	
	public boolean habitCalInsertChk(String pKey,String chk) {
    	System.out.println("HcServiceImp habitCalInsertChk");						      						    					
		return hcDao.habitCalInsertChk(pKey,chk);
	}	    
    
	//V혼자하기 공개 비공개 여부
	@Override
	public boolean updateCalWith(HcDto HcDto) {
    	System.out.println("HcServiceImp updateCalWith");						      						    							
		return hcDao.updateCalWith(HcDto);
	
	}    
    
	//V해당 아이디 습관달력 삭제
	@Override
	public boolean habitCalDelete(String pKey,String id) {
    	System.out.println("HcServiceImp habitCalDelete");						      						    									
		return hcDao.habitCalDelete(pKey,id);
	}	
	
	//V해당 아이디 인증 페이지들 모두 삭제
	@Override   
	public boolean deleteHcInChk(String pKey,String id) {
    	System.out.println("HcServiceImp deleteHcInChk");						      						    											
		return hcDao.deleteHcInChk(pKey,id);
	}	

	//V모든 회원들의 '혼자' 하기 리스트 보기
	@Override
		public List<HcDto> getAllHcListAlone() {
    	System.out.println("HcServiceImp getAllHcListAlone");						      						    													
		return hcDao.getAllHcListAlone();
	}	

	//V모든 회원들의 '함께' 하기 리스트 보기
	@Override
		public List<HcDto> getAllHcListWith() {
    	System.out.println("HcServiceImp getAllHcListWith");						      						    															
		return hcDao.getAllHcListWith();
	}
	
	//V아이디 검색
	public List<HcDto> getSearchID(String searchId, String withh){
    	System.out.println("HcServiceImp getSearchID");						      						    													
		return hcDao.getSearchID(searchId,withh);
	}
   
	//V제목 검색
	public List<HcDto> getSearchTitle(String searchTitle, String withh){
    	System.out.println("HcServiceImp getSearchTitle");						      						    															
		return hcDao.getSearchTitle(searchTitle,withh);
	}
   
	//V기간 검색
	public List<HcDto> getSearchTerm(String searchTerm, String withh){
    	System.out.println("HcServiceImp getSearchTerm");						      						    															
		return hcDao.getSearchTerm(searchTerm,withh);
	}

	//V시작일 검색
	public List<HcDto> getSearchStartDate(String searchStartDate, String withh){
    	System.out.println("HcServiceImp getSearchStartDate");						      						    																	
		return hcDao.getSearchStartDate(searchStartDate,withh);
	}
	
	
	
	
    //유저 정보 변경
    @Override
    public boolean updateUser(HcLoginDto dto) {
       return hcDao.updateUser(dto);
    }
    
    //탈퇴하기
    @Override
    public boolean deleUser(String id) {
       return hcDao.deleUser(id);
    }

	//탈퇴한 아이디 리스트 지우기
	@Override
	public boolean deleList(String id) {
		return hcDao.deleList(id);
	}	    
    


	
	//종료일이 지난 모든 리스트들 가저오기
	@Override
	public List<HcDto> getAllListEndY(String id) {
		return hcDao.getAllListEndY(id);
	}	
	
	//인증값 가저오기
	@Override
	public HcInChkDto getHcUserInChk(HcInChkDto HcInChkDto){
	      
		return hcDao.getHcUserInChk(HcInChkDto);
	}   	
	
	//pKey가 같은 습관달력들 구하기
	public List<HcDto> getHabitCalList(String pKey){
		return hcDao.getHabitCalList(pKey);
	}
	
	//인증삭제하기
	@Override
	public boolean deleteHcUserInChk(HcInChkDto HcInChkDto){
	      
		return hcDao.deleteHcUserInChk(HcInChkDto);
	}      	
   
	//해당일 인증해야 하는 것들 다 가지고 오기	
	@Override
	public List<HcInChkDto> getHcInChk(HcInChkDto HcInChkDto){
		      
		return hcDao.getHcInChk(HcInChkDto);
	}


	

	
	
	@Override
	public boolean updateHcInChk(HcInChkDto HcInChkDto) {
	      
		return hcDao.updateHcInChk(HcInChkDto);
	}
	
	
	
   @Override
   public List<HcDto> searchContentId(String searchContent) {
      return hcDao.searchContentId(searchContent);
   }

   @Override
   public List<HcDto> searchContentTitle(String searchContent) {
      return hcDao.searchContentTitle(searchContent);
   }




   



   
   
   


   

   
   

   
//insertUser   



   @Override
   public List<HcLoginDto> getAllUser() {
      return hcDao.getAllUser();
   }

   @Override
   public boolean updateRoleUser(String id, String role, String enabled) {
      return hcDao.updateRoleUser(id, role, enabled);
   }
   

   

   
   

   
	//랭킹
	public List<HcDto> boardlistWithRanking(){
		   return hcDao.boardlistWithRanking();

	}

}