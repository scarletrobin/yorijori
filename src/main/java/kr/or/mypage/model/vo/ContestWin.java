package kr.or.mypage.model.vo;

import lombok.Data;

@Data
public class ContestWin {
//private int winNo;
private int contestNo;
private int voteCount;
private String contestMonth;
private int contestResult;
private int recipeWriter;
private String memberNickName;
private String memberId;
private String profilePath;
private String filePath;
private String recipeTitle;
}
