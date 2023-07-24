package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProPhotoVO {
	
	private int member_idx;
	private String photo_name;
	private MultipartFile photo;

}
