package home;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import home.dao.BoardDAO;
import home.dao.HomeDAO;
import home.dto.BoardCommentDTO;
import home.dto.BoardDTO;
import home.dto.ShowDTO;
import home.dto.ShowMemberDTO;
import page.Pager;



@WebServlet("/home_servlet/*")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri=request.getRequestURI();
		String context=request.getContextPath();
		
		HomeDAO dao=new HomeDAO();
		BoardDAO dao1=new BoardDAO();
		
		
		if(uri.indexOf("showMember.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String name=request.getParameter("name");
			String jumin=request.getParameter("jumin");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String juso=request.getParameter("juso");
			ShowMemberDTO dto=new ShowMemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setJumin(jumin);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setJuso(juso);
			dao.showMemberInsert(dto);
			
			String url="/page/index.jsp";
			response.sendRedirect(context+url);
			/*String page="/page/index.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);*/
		}else if(uri.indexOf("userid_check.do") != -1){
			String userid=request.getParameter("userid");
			System.out.println("userid:"+userid);
			ShowMemberDTO dto=new ShowMemberDTO();
			dto.setUserid(userid);
			//dao.userid_check(userid);
			String result=dao.userid_check(userid);
			String message="";
			String page="/page/users.jsp";
			if(result != null){
				message="중복된 아이디가 있습니다.";
				System.out.println("message:"+message);
				request.setAttribute("message", message);
			}else{
				message="사용 가능한 아이디입니다.";
				System.out.println("message:"+message);
				request.setAttribute("message", message);
			}
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("loginCheck.do") != -1){
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			ShowMemberDTO dto=new ShowMemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String result=dao.loginCheck(userid,passwd);
			String page="/page/loginPage.jsp";
			if(result != null){
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				page="/page/index.jsp";
				response.sendRedirect(context+page);
			}else{
				/*request.setAttribute("message", "로그인실패");*/
				response.sendRedirect(
						context+page+"?message=error");
			}
			
		}else if(uri.indexOf("logout.do") != -1){
			HttpSession session = request.getSession();
			
			session.invalidate();

			String page="/page/index.jsp";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("Mouth.do") != -1){
			List<ShowDTO> list=dao.showMouthList();
			HttpSession session=request.getSession();
			session.setAttribute("mouthList", list);
			
			
			String page="/page/show_mouth.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("Myeondo.do") != -1){
			List<ShowDTO> list=dao.showMyeondoList();
			HttpSession session=request.getSession();
			session.setAttribute("myeondoList", list);
			
			
			String page="/page/show_myeondo.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("Sean.do") != -1){
			List<ShowDTO> list=dao.showSeanList();
			HttpSession session=request.getSession();
			session.setAttribute("seanList", list);
			
			
			String page="/page/show_sean.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("Badi.do") != -1){
			List<ShowDTO> list=dao.showBadiList();
			HttpSession session=request.getSession();
			session.setAttribute("badiList", list);
			
			
			String page="/page/show_badi.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("Syampu.do") != -1){
			List<ShowDTO> list=dao.showSyampuList();
			HttpSession session=request.getSession();
			session.setAttribute("syampuList", list);
			
			
			String page="/page/show_syampu.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("Yuyeonje.do") != -1){
			List<ShowDTO> list=dao.showYuyeonjeList();
			HttpSession session=request.getSession();
			session.setAttribute("yuyeonjeList", list);
			
			
			String page="/page/show_yuyeonje.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("baguny.do") != -1){
			List<ShowDTO> list=dao.showBagunyList();
			HttpSession session=request.getSession();
			session.setAttribute("bagunyList", list);
			
			
			String page="/page/baguny.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("edit.do") != -1){
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
			/*List<ShowMemberDTO> list=dao.memberWrite(userid);*/
			ShowMemberDTO dto=dao.memberWrite(userid);
			request.setAttribute("memberWrite", dto);
			
			String page="/page/memberEdit.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);		
		}else if(uri.indexOf("memberUpdate.do") != -1){
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
			String passwd=request.getParameter("passwd");
			String email=request.getParameter("email");
			String hp=request.getParameter("hp");
			String juso=request.getParameter("juso");
			
			
			ShowMemberDTO dto=new ShowMemberDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setEmail(email);
			dto.setHp(hp);
			dto.setJuso(juso);
			dao.memberUpdate(dto);
			
			
			
			String url="/page/index.jsp";
			response.sendRedirect(context+url);		
		}else if(uri.indexOf("memberDelete.do") != -1){
			HttpSession session=request.getSession();
			String userid=(String)session.getAttribute("userid");
			
			dao.memderDelete(userid);
			
			session.invalidate();
			
			String url="/page/index.jsp";
			response.sendRedirect(context+url);	
		}
		
		//board
		else if(uri.indexOf("list.do") != -1){
			//레코드 갯수 계산
			int count=dao1.count();
			int curPage=1;
			
			//숫자 처리는 null포인트 익셉션이 잘일어나기 때문에 if문 처리해주는게 좋다.
			if(request.getParameter("curPage") != null){
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			
			//System.out.println("list.do 호출");
			List<BoardDTO> list=dao1.list(start,end);
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			String page="/page/list.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insert.do") != -1){
			//파일업로드 처리
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			//(request,파일업로드 디렉토리,업로드용량,파일인코딩,
			//중복파일정책)
			MultipartRequest multi
			=new MultipartRequest(request,Constants.UPLOAD_PATH,
					Constants.MAX_UPLOAD, "utf-8", 
					new DefaultFileRenamePolicy());
			
			String userid=multi.getParameter("userid");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr(); //클라이언트의 ip주소
			String filename=" "; //공백 1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null){
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			BoardDTO dto=new BoardDTO();
			dto.setUserid(userid);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부를 하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename == null || filename.trim().equals("")){
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao1.insert(dto);
			String page="/home_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("download.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao1.getFileName(num);
			System.out.println("첨부파일 이름:"+filename);
			
			//다운로드할 파일 경로
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096];//바이트배열 생성
			//서버에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			//mimeType(파일의 종류-img,mp3,text...등)
			String mimeType=getServletContext().getMimeType(path);
			if(mimeType==null){
				mimeType="application/octet-stream;charset=utf-8";
			}
			/* 파일정보를 header로 값을 보내게 되는데 header에는
			 * 한글이나 특수문자가 올 수 없기 때문에 
			 * 서유럽언어(영어권) 표준 8859_1로 인코딩처리해야한다.
			 * 즉, 편법으로 잠시 변환처리해서 보내는것임.
			 * new String(바이트배열, 변환할인코딩) */
			
			filename = 
			new String(filename.getBytes("utf-8"), "8859_1");
			
			//http header
			response.setHeader("Content-Disposition", 
					"attachment;filename="+filename);
			//http body
			//OutputStream 생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while(true){
				numRead = fis.read(b,0,b.length);//데이터 읽음(byte b[], int off, int len)
				if(numRead == -1) break;//더 이상 내용이 없으면
				out.write(b, 0, numRead);//데이터 쓰기(byte b[], int off, int len)
			}
			//파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			//다운로드 횟수 증가 처리
			dao1.plusDown(num);
		}else if(uri.indexOf("view.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가 처리
			dao1.plusReadCount(num, session);
			//번호에 해당하는 게시물 리턴
			BoardDTO dto=dao1.viewReplace(num);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//화면전환
			String page="/page/view.jsp";
			RequestDispatcher rd=
					request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("commentList.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호:"+num);
			//댓글 목록 리턴
			List<BoardCommentDTO> list=dao1.commentList(num);
			//request영역에 저장
			request.setAttribute("list", list);
			//출력 페이지 이동
			String page="/page/comment_list.jsp";
			RequestDispatcher rd
			=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("comment_add.do") != -1){
			BoardCommentDTO dto=new BoardCommentDTO();
			
int board_num=Integer.parseInt(request.getParameter("board_num"));
            String writer=request.getParameter("writer");
            String content=request.getParameter("content");
            dto.setBoard_num(board_num);
            dto.setWriter(writer);
            dto.setContent(content);
            dao1.commentAdd(dto);
            //이곳은 백그라운드로 실행되기 때문에 어디로 page이동하든
            //소용없다.
		}else if(uri.indexOf("reply.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao1.view(num);
			dto.setContent("===게시물의 내용===\n"+dto.getContent());
			request.setAttribute("dto", dto);
			String page="/page/reply.jsp";
			RequestDispatcher rd
			  =request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("insertReply.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao1.view(num);
			int ref=dto.getRef(); //답변 그룹 번호
			int re_step=dto.getRe_step()+1;//출력 순번
			int re_level=dto.getRe_level()+1;//답변 단계
			String userid=request.getParameter("userid");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			dto.setUserid(userid);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			//첨부파일 관련 정보
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			//답글 순서 조정
			dao1.updateStep(ref, re_step);
			//답글 쓰기
			dao1.reply(dto);
			
			String page="/home_servlet/list.do";
			response.sendRedirect(context + page);
		}else if(uri.indexOf("pass_check.do") != -1){//비밀번호 체크
			int num=Integer.parseInt(request.getParameter("num"));
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			String result=dao1.passwdCheck(userid, passwd , num);
			String page="";
			if(result != null){//비밀번호가 맞으면
				page="/page/edit.jsp";
				request.setAttribute("dto", dao1.view(num));
				RequestDispatcher rd
				  =request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{//비밀번호가 틀리면
				page=context+"/home_servlet/view.do?num="+num+"&message=error";//view.jsp 에서 error메시지 캐치
				response.sendRedirect(page);
			}
		}/*else if(uri.indexOf("passwd_check.do") != -1){//비밀번호 체크
			HttpSession session=request.getSession();
			int num=Integer.parseInt(request.getParameter("num"));
			String userid=request.getParameter("userid");
			String userid=(String)session.getAttribute("userid");
			String passwd=request.getParameter("passwd");
			String result=dao1.passwdCheck(userid, passwd);
			String page="";
			
			System.out.println("userid="+userid);
			System.out.println("passwd="+passwd);
			if(result != null){//비밀번호가 맞으면
				page="/home_servlet/insertReply.do";
				RequestDispatcher rd
				  =request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{//비밀번호가 틀리면
				page=context+"/home_servlet/reply.do?message=error";//view.jsp 에서 error메시지 캐치
				response.sendRedirect(page);
			}
		}*/
		else if(uri.indexOf("update.do") != -1){
			//파일업로드 처리
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()){
				uploadDir.mkdir();
			}
			/*request를 확장시킨 MultipartRequest 생성
			(request,파일업로드 디렉토리,업로드용량,파일인코딩,
			중복파일정책)
			주의 : MultipartRequest를 생성해서 쓸 땐
			request를 쓰면 에러가 남으로 주의*/
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
					, "utf-8", new DefaultFileRenamePolicy());
			int num=Integer.parseInt(multi.getParameter("num"));
			String userid=multi.getParameter("userid");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();//클라이언트의 ip주소
			String filename=" ";//공백 1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음 요소가 있으면
				while(files.hasMoreElements()){
					//첨부파일의 이름
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);//name="file1"
					File f1=multi.getFile(file1);
					if(f1 != null){
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto=new BoardDTO();
			dto.setNum(num);
			dto.setUserid(userid);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			//trim()문자열의 공백제거 함수
			if(filename == null || filename.trim().equals("")){
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				BoardDTO dto2=dao1.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else{
				//새로운 첨부파일이 있을 때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			//첨부파일 삭제 처리
			String fileDel=multi.getParameter("fileDel");
			//체크박스에 체크되었고(&&), value없이 썼을때는 on이 디폴트
			if(fileDel != null && fileDel.equals("on")){
				String fileName=dao1.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete(); //파일 삭제
				//첨부파일 정보를 지움
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0); 

			}
			//레코드 수정
			dao1.update(dto);
			//페이지 이동
			String page="/home_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("delete.do") != -1){
			//파일업로드를 안쓰더라도 MultipartRequest 처리를 해야한다.
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD
					, "utf-8", new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			dao1.delete(num);
			//페이지 이동
			String page="/home_servlet/list.do";
			response.sendRedirect(context+page);
		}else if(uri.indexOf("search.do") != -1){
	
			//검색옵션과 검색 키워드
			String search_option=
					request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			
			List<BoardDTO> list
			  =dao1.searchList(search_option, keyword);
			
			request.setAttribute("list", list);
			
			
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", "%"+keyword+"%");
			/*String page="/page/search.jsp";*/
			String page="/page/list.jsp";
			RequestDispatcher rd
			  =request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
