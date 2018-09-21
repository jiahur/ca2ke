package category.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.bean.CategoryDTO;
import category.dao.CategoryDAO;

@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO dao;
	
	
	@RequestMapping(value="/addCategory",
				    method=RequestMethod.POST)
	public ModelAndView addCategory(CategoryDTO dto, MultipartFile img) {
		String path = 
				"C:\\Users\\user\\git\\git_repo\\ca2ke\\src\\main\\webapp\\storage";
		String fname = img.getOriginalFilename();
		
		File file = new File(path, fname);
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		dto.setCategory_image(fname);
		dao.insert(dto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("main/index.jsp");
		return modelAndView;
	}
}
