package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProMemberVO {
	
	private int member_idx; // 관리번호
	private String email; // 이메일
	private String pw; // 비밀번호
	private String name; // 이름
	private String nickname; // 별명
	private String address_postcode; // 우편번호
	private String address; // 주소
	private String address_detail; // 상세주소
	private String phone; // 핸드폰

}
