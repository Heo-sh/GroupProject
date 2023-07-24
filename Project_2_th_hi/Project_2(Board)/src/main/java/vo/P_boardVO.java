package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class P_boardVO {
	private int board_id; //일련번호
	private String content; //내용
	private String regdate; //작성일
	private int like_b; //좋아요 수
	private int member_idx; //작성자
	private String ip; //ip
}
