package kr.or.recipecontest.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.recipe.model.vo.RecipeBoard;
import kr.or.recipecontest.model.vo.ContestViewData;
import kr.or.recipecontest.model.vo.RecipeContest;

@Repository
public class RecipeContestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectTotalCount() {
		int totalCount = sqlSession.selectOne("recipecontest.totalCount");
		return totalCount;
	}

	public ArrayList<RecipeContest> selectContestList(HashMap<String, Object> map) {
		List<RecipeContest> list = sqlSession.selectList("recipecontest.selectList", map);
		return (ArrayList<RecipeContest>) list;
	}

	public int voteCheck(int memberNo) {
		int result = sqlSession.selectOne("recipecontest.selectVote", memberNo);
		return result;
	}

	public int insertVote(HashMap<String, Object> map) {
		int result = sqlSession.insert("recipecontest.insertVote", map);
		return result;
	}

	public int selectContestNo(int memberNo) {
		int contestNo = sqlSession.selectOne("recipecontest.selectContestNo", memberNo);
		return contestNo;
	}

	public ArrayList<RecipeContest> searchContestList(HashMap<String, Object> map) {
		List<RecipeContest> searchList = sqlSession.selectList("recipecontest.searchList", map);
		return (ArrayList<RecipeContest>) searchList;
	}

	public int selectTotalCount(String searchtype, String searchword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchtype", searchtype);
		map.put("searchword", searchword);
		int totalCount = sqlSession.selectOne("recipecontest.searchCount", map);
		return totalCount;
	}

	public ArrayList<ContestViewData> selectRecipeList(HashMap<String,Object> map) {
		List<ContestViewData> list = sqlSession.selectList("recipecontest.selectRecipeList", map);
		return (ArrayList<ContestViewData>) list;
	}

	public int deleteContestRecipe(int enteredNo) {
		int result = sqlSession.delete("recipecontest.deleteContestRecipe", enteredNo);
		return result;
	}

	public int insertContestRecipe(HashMap<String, Object> map) {
		int result = sqlSession.insert("recipecontest.insertContestRecipe", map);
		return result;
	}

	public ArrayList<RecipeContest> selectContestRecipeList() {
		List<RecipeContest> oneTwoThree = sqlSession.selectList("recipecontest.selectContestRecipeList");
		return (ArrayList<RecipeContest>) oneTwoThree;
	}

	public int insertContestRecipe(int recipeNo) {
		int result = sqlSession.insert("recipecontest.insertContest", recipeNo);
		return result;
	}

	public int updateContestWinners(ArrayList<RecipeContest> oneTwoThree) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int count = 0;
		for(int i=0;i<oneTwoThree.size();i++) {
			int rank = i+1; //0번째는 1등, 1번째 2등, 2번째 3등
			map.put("winner", oneTwoThree.get(i));
			map.put("rank", rank);
			int result = sqlSession.update("recipecontest.updateContestWinners", map);
			count += result;
			if(i <= 1) {
				map.put("point", 200000);
				sqlSession.update("recipecontest.updateMemberPoints", map);
			} else if (i == 2) {
				map.put("point", 100000);
				sqlSession.update("recipecontest.updateMemberPoints", map);
			}
		}
		return count;
	}

	public ArrayList<RecipeContest> updateSpecialWinners(ArrayList<RecipeContest> special) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			for(int i=0; i<special.size(); i++) {
				map.put("winner", special.get(i));
				map.put("rank", 4);
				map.put("point", 10000);
				sqlSession.update("recipecontest.updateMemberPoints", map);
				sqlSession.update("recipeContest.updateContestWinners", map);
			
		}
		return (ArrayList<RecipeContest>) special;
	}

	public ArrayList<RecipeContest> selectSpecialWinners() {
		List<RecipeContest> special = sqlSession.selectList("recipecontest.selectSpecialWinners");
		return (ArrayList<RecipeContest>) special;
	}

}
