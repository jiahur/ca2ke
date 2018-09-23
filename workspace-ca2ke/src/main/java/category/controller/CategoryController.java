package category.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

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
				"C:\\Users\\user\\project\\ca2ke\\workspace-ca2ke\\src\\main\\webapp\\storage\\category";
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
		modelAndView.setViewName("category_view");
		return modelAndView;
	}
		
	@RequestMapping(value="/updateCategoryForm")
	public ModelAndView updateCategoryForm(int req) {
		CategoryDTO dto = dao.getCategoryArticle(req);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);
		modelAndView.setViewName("category/updateCategory.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/updateCategory",
					method=RequestMethod.POST)
	public ModelAndView updateCategory(CategoryDTO dto, MultipartFile img) {
		String path = 
				"C:\\Users\\user\\project\\ca2ke\\workspace-ca2ke\\src\\main\\webapp\\storage\\category";
		
		if(!img.getOriginalFilename().equals("")) {
			System.out.println("into FileProcess");
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
		}
		dto.setCategory_image(dto.getCategory_image());
		dao.update(dto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("category_view");
		return modelAndView;
	}
	
	@RequestMapping(value="/category_view")
	public ModelAndView category_view() {
		List<CategoryDTO> list = dao.getAllCategory();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("category/category_view.jsp");
		return modelAndView;
	}
}
