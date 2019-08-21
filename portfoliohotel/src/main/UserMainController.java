package main;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import room.RoomService;
import room.RoomVO;

@Controller
public class UserMainController {
	
	@Autowired
	RoomService roomService;

	@RequestMapping("/index")
	public String index(Model model, RoomVO rvo) throws Exception {
		ArrayList<RoomVO> list_r = roomService.list(rvo);
		
		model.addAttribute("list_r", list_r);
		return "index";
	}
	
	@RequestMapping("/meeting_wedding/meeting")
	public String meeting(Model model) throws Exception {
		
		return "meeting_wedding/meeting";
	}
	
	@RequestMapping("/meeting_wedding/wedding")
	public String wedding(Model model) throws Exception {
		
		return "meeting_wedding/wedding";
	}
	
	@RequestMapping("/meeting_wedding/familyparty")
	public String familyparty(Model model) throws Exception {
		
		return "meeting_wedding/familyparty";
	}
	
	@RequestMapping("/facilities")
	public String facilities(Model model) throws Exception {
		
		return "facilities";
	}
	
}
