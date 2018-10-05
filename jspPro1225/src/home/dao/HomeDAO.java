package home.dao;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import home.dto.ShowDTO;
import home.dto.ShowMemberDTO;
import sqlmap.MybatisManager;


public class HomeDAO {

	public void showMemberInsert(ShowMemberDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("home.showMemberInsert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}//showMemberInsert

	public String loginCheck(String userid,String passwd) {
		String result="";
		SqlSession session=null;
		
		try {
			Map <String,Object> map=new HashMap<>();
			map.put("userid", userid);
			map.put("passwd", passwd);
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("home.loginCheck",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}//loginCheck

	public List<ShowDTO> showMouthList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showMouthList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ShowDTO> showMyeondoList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showMyeondoList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ShowDTO> showSeanList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showSeanList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ShowDTO> showBadiList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showBadiList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ShowDTO> showSyampuList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showSyampuList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ShowDTO> showYuyeonjeList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showYuyeonjeList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public List<ShowDTO> showBagunyList() {
		SqlSession session=null;
		List<ShowDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("home.showBagunyList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public ShowMemberDTO memberWrite(String userid) {
		SqlSession session=null;
		ShowMemberDTO list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectOne("home.memberWrite",userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}

	public void memberUpdate(ShowMemberDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("home.memberUpdate",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public void memderDelete(String userid) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("home.memberDelete",userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	public String userid_check(String userid) {
		String result="";
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			result=session.selectOne("home.userid_check",userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return result;
	}


}
