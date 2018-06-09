/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaBean;

import java.util.ArrayList;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class QuizBean {

    private ArrayList<ProblemBean> problems = new ArrayList<ProblemBean>();
    private int currentIndex;
    private int score;

    public QuizBean() {
        problems.add(new ProblemBean("制造日期与有效期是同一天的产品是什么？", "报纸"));
        problems.add(new ProblemBean("什么东西肥得快，瘦得更快？", "气球"));
        problems.add(new ProblemBean("放一支铅笔在地上，要使任何人都无法跨过，怎么做？", "放在墙角"));
        problems.add(new ProblemBean("青蛙为什么跳得比树高？", "树不会跳"));
        problems.add(new ProblemBean("最不听话的是什么人？", "聋子"));
    }

    public void setProblems(ArrayList<ProblemBean> problems) {
        this.problems = problems;
        currentIndex = 0;
        score = 0;
    }

    public int getScore() {
        return score;
    }
    public ProblemBean getCurrent(){
        return problems.get(currentIndex);
    }
    public String getAnswer(){
        return "";
    }
    public void setAnswer(String str){
        try{
            if(getCurrent().getAnswer().equals(str)) score++;
            currentIndex = (currentIndex + 1) % problems.size();
        }
        catch(Exception e){
            System.out.println(e.toString());
        }
    }

}
