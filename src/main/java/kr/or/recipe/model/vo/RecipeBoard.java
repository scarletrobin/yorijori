package kr.or.recipe.model.vo;

import java.util.ArrayList;

import kr.or.milkit.model.vo.Product;
import lombok.Data;

@Data
public class RecipeBoard {
	private int recipeNo;
	private int recipeWriter;
	private String recipeTitle;
	private String filepath;
	private int readCount;
	private String recipeDate;
	private String subhead;
	private String recipeVideo;
	private String recipeTime;
	private String foodName;
	private int recipeLevel;
	private int situation;
	private int material;
	private int recipeDelete;
	private ArrayList<RecipeContent>rList;
	private ArrayList<Material>mList;
	private String nickname;
	private int likeCheck;
	private int reportCheck;
	private int likeCnt;
	private ArrayList<Product>pList;
}
