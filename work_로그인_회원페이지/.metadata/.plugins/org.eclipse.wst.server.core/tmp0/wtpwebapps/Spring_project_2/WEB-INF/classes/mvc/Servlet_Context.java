package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.pj.photo.MemberController;

import dao.ProMemberDAO;
import dao.ProPhotoDAO;

@Configuration
@EnableWebMvc // mvc 환경을 사용한다는 뜻
// dao를 사용하지 않으므로 자동탐색으로 설정가능
// @ComponentScan("com.pj.photo") // 여러개 지정 가능
// Componet의 자식요소를 전부 탐색해서 객체로 만들어준다

//어노테이션에도 상속관계가 있다
/*
 *@Component
 *	ㄴ@Controller
 *	ㄴ@Service
 *	ㄴ@Repository 
 * */
//컴포넌트의 자식객체가 들어있으면 사실 Controller가 아니어도 만들어 질 수 있다.
public class Servlet_Context implements WebMvcConfigurer {
		
	// ServletContext.xml 참조
	
	// 내가 앞으로 사용할 이미지, JS, CSS 파일과 같은 참조파일들을 webapp/resources에 보관을 해라
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}

	
//	  @Bean 
//	  public InternalResourceViewResolver resolver() {
//	  InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//	  resolver.setViewClass(JstlView.class); resolver.setPrefix("/WEB-INF/views/");
//	  resolver.setSuffix(".jsp"); return resolver; }
	
	@Bean
	public MemberController memberController(ProMemberDAO proMember_dao, ProPhotoDAO proPhoto_dao) {
		return new MemberController(proMember_dao, proPhoto_dao);
	}
	
	
	

}
