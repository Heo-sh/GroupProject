package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class B_commentVO {
	private int idx; 		//1.댓글 번호 - 순번이 낮을수록 최신댓글
	private int answernum; 	//2.해당 댓글의 자식댓글
	private String content;	//3.댓글 내용
	private String regdate;	//4.작성일자
	private int parentnum;	//5.부모댓글의 ID값
	private int ref;		//6.부모댓글과 자식댓글의 묶음
	private int reforder;	//7.댓글 그룹들의 순서
	private int step;		//8.댓글의 계층
	private int like_b;		//9.좋아요의 기능
	private int board_id;	//10.게시글의 ID
	private int member_idx; //11.댓글 작성자의 관리번호
	private String ip; 		//12.ip 주소
	private String nickname;
}
