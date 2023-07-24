package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProPhotoVO {
	private int photo_num; //사진관리번호
	private String photo_name; //사진 이름
	private int member_idx; //작성자 번호
	private String regdate; //사진 저장날짜
	private int brand_num; //사진의 브랜드 번호
	private int board_id; //seq_board_id.currval을 담을 변수
}
