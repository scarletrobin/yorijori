package kr.or.recipe.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.milkit.model.vo.product;
import kr.or.recipe.model.service.RecipeService;
import kr.or.recipe.model.vo.FileVo;
import kr.or.recipe.model.vo.Material;
import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipe.model.vo.RecipeContent;

@Controller
public class RecipeController {
	@Autowired
	private RecipeService service;
	
	@RequestMapping(value = "/recipeBoard.do")
	public String recipeBoard(Model model) {
		ArrayList<RecipeBoard>list = service.selectRecipeList();
		model.addAttribute("list", list);
		return "recipe/recipeBoard";
	}
	@RequestMapping(value = "/recipeWrite.do")
	public String recipeWrite() {
		return "recipe/recipeFrm";
	}
	
	@RequestMapping(value="/recipeFrm.do")
	public String recipeFrm(RecipeBoard rb, RecipeContent rc, MultipartFile[] files,Material m, Model model, HttpServletRequest request,MultipartFile uploadImg, FileVo fv) {
			String[] mNameList = request.getParameterValues("mNameList");
			for(int i = 0; i<mNameList.length; i++) {
				m.setMAmount(m.getMAmountList()[i]);
				m.setMaterialName(m.getMNameList()[i]);
			}
			String[] rContentList = request.getParameterValues("rContentList");
			for(int i =0; i<rContentList.length;i++) {
				rc.setRecipeContent(rc.getRContentList()[i]);
			}
			String savepath = request.getSession().getServletContext().getRealPath("/resources/upload/recipe/");
			FileVo upFile =uploadFile(uploadImg, savepath);
			rb.setFilepath(upFile.getFilepath());
			if(files[0].isEmpty()) {
				
			}else {
				for( MultipartFile file2 : files) {
					upFile = uploadFile(file2 ,savepath);
					rc.setFilename(upFile.getFilename());
					rc.setFilepath(upFile.getFilepath());	
					
				}
			}
			int result = service.insertRecipe(rb, rc, m);
			if(result > 0) {
				model.addAttribute("msg", "등록성공");
				model.addAttribute("loc", "/recipeBoard.jsp");
			}else {
				model.addAttribute("msg", "등록실패");
				model.addAttribute("loc", "/recipeBoard.jsp");
			}
		return "common/msg";
		
	}
	private FileVo uploadFile(MultipartFile file , String savepath) {
		String filename = file.getOriginalFilename();
		String onlyfilename = filename.substring(0,filename.indexOf("."));
		String extent = filename.substring(filename.indexOf("."));
		String filepath = null;
		int count = 0;
		while(true) {
			if(count == 0) {
				filepath = onlyfilename + extent;
			}else {
				filepath = onlyfilename + "_" + count + extent;
			}
			File checkFile = new File(savepath + filepath); 
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		try {
			FileOutputStream fos = new FileOutputStream(new File(savepath+filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		FileVo fv = new FileVo();
		fv.setFilename(filename);
		fv.setFilepath(filepath);
		return fv;
	}
	
}
