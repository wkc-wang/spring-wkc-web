package com.edu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.bean.Product;
import com.edu.exception.MyException;
import com.edu.group.GroupValidate1;
import com.edu.service.ProductService;
import com.edu.util.UUIDUtil;
@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@GetMapping("/list")
	public String list(Model model) throws MyException {
		List<Product> productList=productService.getAll();
		model.addAttribute("productList",productList);
		return "list";
	}
//	@ResponseBody
//	@RequestMapping(value="/json",method=RequestMethod.POST)
//	public Product responseJson(Product product) {
//		return product;
//	}
	@ResponseBody
	@RequestMapping(value="/json2",method=RequestMethod.POST)
	public Product responseJson2(@RequestBody Product product) {
		return product;
	}
	@GetMapping("/edit")
	public String addUI() {
		return "addUI";
	}
	@PostMapping("/edit")
	public String add(Product product) {
		product.setId(UUIDUtil.getCode());
		productService.save(product);
		return "redirect:/list";
	}
	@GetMapping("/edit/{id}")
	public String editUI(@PathVariable("id") String id,Model model) throws MyException {
		Product product=productService.getById(id);
		model.addAttribute("product",product);
		return "editUI";
	}
//	@PutMapping("/edit")
	@RequestMapping(value="/editController",method=RequestMethod.POST)
	public String edit(@Validated(GroupValidate1.class) Product product,BindingResult result,Model model) {
		if(result.hasErrors()) {
			List<ObjectError> allErrors=result.getAllErrors();
			for (ObjectError objectError : allErrors) {
				System.out.println(objectError.getDefaultMessage());
			}
			model.addAttribute("allErrors", allErrors);
			return "editUI";
		}
		productService.update(product);
		return "redirect:/list";
	}
	@DeleteMapping("/edit/{id}")
	public String list(@PathVariable("id") String id) {
		productService.deleteById(id);
		return "redirect:/list";
	}
}
