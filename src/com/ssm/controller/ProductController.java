package com.ssm.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ssm.po.*;
import com.ssm.service.*;
import com.ssm.util.Const;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@SessionAttributes({ "nowadmin" })
@RequestMapping(value = "admin/")
public class ProductController {

	@Resource(name = "adminService")
	public AdminService adminService;

	@Resource(name = "schoolService")
	public SchoolService schoolService;

	@Resource(name = "taskService")
	public TaskService taskService;

	@Resource(name = "userService")
	public UserService userService;

	@Resource(name = "productService")
	public ProductService productService;


	// 读取全部
	@RequestMapping("productList.do")
	public String productList(Model model) {
		List<Product> list = productService.getAll();
		model.addAttribute("list", list);
		return "adminProduct";
	}

	// 读取一个信息
	@RequestMapping("getOneProduct.do")
	public String getOneProduct(String id, Model model) {
		if (id == null) {
			model.addAttribute("msg", "出现错误");
			return "adminProductSetting";
		} else {
			if (id.length() == 0) {
				model.addAttribute("msg", "出现错误");
				return "adminProductSetting";
			}
		}
		int productid = 0;
		try {
			productid = Integer.parseInt(id);
			if (productid == 0) {
				model.addAttribute("msg", "出现错误");
				return "adminProductSetting";
			}
		} catch (Exception e) {
			model.addAttribute("msg", "出现错误");
			return "";
		}

		Product product = productService.getById(productid);

		if (product != null) {
			model.addAttribute("product", product);
		} else {
			model.addAttribute("msg", "读取失败");
		}
		return "adminProductSetting";
	}

	// 更新院校
	@RequestMapping("updateProduct.do")
	public String updateProuduct(Product product, Model model) {
		int r = 0;
		r = productService.update(product);
		if (r > 0) {
			model.addAttribute("msg", "修改成功-刷新页面重新加载显示");
		} else {
			model.addAttribute("msg", "修改失败");
		}
		/*Product theSchool = productService.getById(product.getId());
		model.addAttribute("theSchool", theSchool);*/
		return "adminProductSetting";
	}

	// 执行添加商品
	@RequestMapping("addProduct.do")
	public String addProduct(String name, Model model,HttpServletRequest request) {
		String price=request.getParameter("price");
		String icon=request.getParameter("icon");
		if (name == null) {
			model.addAttribute("msg", "添加失败");
			return "adminProductAdd";
		} else {
			if (name.length() == 0) {
				model.addAttribute("msg", "添加失败");
				return "adminProductAdd";
			}
		}
		Product product=new Product();
		product.setName(name);
		product.setPrice(price);
		product.setIcon(icon);
		int r = 0;
		r = productService.add(product);
		if (r > 0) {
			model.addAttribute("msg", "添加成功");
			model.addAttribute("flag", "添加成功");
			//return "redirect:/admin/productList.do";
			return "adminProductAdd";
		} else {
			model.addAttribute("msg", "添加失败");
			return "adminProductAdd";
		}
	}

	// 执行删除商品
	@RequestMapping("deleteProduct.do")
	public String deleteProduct(Model model,HttpServletRequest request) {
		String id=request.getParameter("id");
		if (id == null) {
			model.addAttribute("msg", "删除失败");
			return "redirect:/admin/productList.do";
		} else {
			if (id.length() == 0) {
				model.addAttribute("msg", "删除失败");
				return "redirect:/admin/productList.do";
			}
		}
		int r = 0;
		r = productService.delete(Integer.parseInt(id));
		if (r > 0) {
			model.addAttribute("msg", "删除成功");
			model.addAttribute("flag", "删除成功");
			return "redirect:/admin/productList.do";
		} else {
			model.addAttribute("msg", "删除失败");
			return "redirect:/admin/productList.do";
		}
	}

	@RequestMapping("/upfile.do")
	@ResponseBody
	public JSONObject upfile(@RequestParam MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws IOException {
		//传到服务器
		//得到真实路径
		String path=request.getSession().getServletContext().getRealPath("/images");
		//目标文件
		String fileName=path+"/"+file.getOriginalFilename();
		file.transferTo(new File(fileName));
		JSONObject result=new JSONObject();
		result.put("errno", 0);
		JSONArray data=new JSONArray();
		data.add(Const.ROOT+"images/"+file.getOriginalFilename());
		result.put("data", data);
		result.put("filename",file.getOriginalFilename());
		return result;
	}

	@org.springframework.web.bind.annotation.InitBinder
	public void InitBinder(ServletRequestDataBinder bin) {
		bin.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
	}

}
