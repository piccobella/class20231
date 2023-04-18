package websocketChat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer") // 웹소켓 서버의 요청명을 설정
public class ChatServer {
  private static Set<Session> clients
   = Collections.synchronizedSet(new HashSet<Session>());//참조 필드
   
   @OnOpen // 클라이언트 접속 시 실행
   public void onOpen(Session s) {
      clients.add(s); // 세션추가
      System.out.println("웹소켓 연결:"+s.getId());
   }
   @OnMessage// 메세지 받으면 실행
   public void onMessage(String m, Session s) throws IOException {
      System.out.println("메세지 전송:"+s.getId()+":"+m);
      synchronized(clients) {
         for(Session session: clients) {//모든 클라이언트에 메세지 전달
            if(!session.equals(s)) { // 단, 메세지를 보낸 클라이언트는 제와
               session.getBasicRemote().sendText(m);
            }
         }
      }
   }
   @OnClose// 클라이언트와의 연결이 끊기면 실행 
   public void onClose(Session s) {
      clients.remove(s);
      System.out.println("웹 소켓 종료!"+s.getId());
   }
   @OnError
   public void onError(Throwable e) { // 에러 발생시 실행
      System.out.println("에러발생");
	   e.printStackTrace();
   }
}