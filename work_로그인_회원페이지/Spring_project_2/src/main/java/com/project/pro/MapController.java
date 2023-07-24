	package com.project.pro;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MapDAO;
import net.sf.json.JSONArray;
import vo.MapVO;

@Controller
public class MapController {
	public static final String VIEW_PATH = "/WEB-INF/views/";
	
	MapDAO map_dao;
	
	public void setMap_dao(MapDAO map_dao) {
		this.map_dao = map_dao;
	}
	
	@RequestMapping(value = {"/", "map.com"})
	public String list(Model model) {
		
		List<MapVO> list = map_dao.selectList();
		model.addAttribute("list",JSONArray.fromObject(list));
	
		return VIEW_PATH + "map.jsp";
	}
	
	
	
}
