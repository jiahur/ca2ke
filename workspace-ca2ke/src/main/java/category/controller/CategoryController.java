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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.bean.CategoryDTO;
import category.dao.CategoryDAO;

@Controller
public class CategoryController {
	@Autowired
	private CategoryDAO dao;
	
	@RequestMapping(value="/addCategoryForm")
	public ModelAndView addCategoryForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tab", "admin_item.jsp");
		modelAndView.addObject("display", "../category/addCategory.jsp");
		modelAndView.setViewName("admin/admin_main.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/addCategory")
	public ModelAndView addCategory(CategoryDTO dto, MultipartFile img) {
		System.out.println(dto);
		System.out.println(img);
		String path = 
				"E:\\workspace\\ca2ke_1st\\src\\main\\webapp\\storage";
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
		int result = dao.insert(dto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("category/category_result.jsp");
		return modelAndView;
	}
		
	@RequestMapping(value="/updateCategoryForm")
	public ModelAndView updateCategoryForm(int req) {
		CategoryDTO dto = dao.getCategoryArticle(req);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("dto", dto);

		modelAndView.addObject("tab", "admin_item.jsp");
		modelAndView.addObject("display", "../category/updateCategory.jsp");
		modelAndView.setViewName("admin/admin_main.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/updateCategory")
	public ModelAndView updateCategory(CategoryDTO dto, MultipartFile img) {
		String path = 
				"E:\\workspace\\ca2ke_1st\\src\\main\\webapp\\storage";
		
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
		int result = dao.update(dto);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("category/category_result.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/category_view")
	public ModelAndView category_view() {
		List<CategoryDTO> list = dao.getAllCategory();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tab", "admin_item.jsp");
		modelAndView.addObject("display", "../category/category_view.jsp");
		modelAndView.addObject("list", list);
		modelAndView.setViewName("admin/admin_main.jsp");
		return modelAndView;
	}
}
