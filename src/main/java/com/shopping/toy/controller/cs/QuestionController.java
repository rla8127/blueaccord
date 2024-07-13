package com.shopping.toy.controller.cs;


import com.shopping.toy.domain.cs.AnswerDto;
import com.shopping.toy.domain.cs.QuestionDto;
import com.shopping.toy.domain.search.PageHandler;
import com.shopping.toy.domain.search.SearchCondition;
import com.shopping.toy.service.cs.AnswerService;
import com.shopping.toy.service.cs.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cs/question")
public class QuestionController {
    @Autowired
    QuestionService questionService;

    @Autowired
    AnswerService answerService;

    @PostMapping("/modify")
    public String modify(Integer page, Integer pageSize, QuestionDto questionDto, Model m, HttpSession session, RedirectAttributes rattr) {
        int memberId = (Integer) session.getAttribute("memberId");
        questionDto.setMember_id(memberId);

        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            System.out.println("page = " + page);

            int rowCnt = questionService.modify(questionDto); // insert

            if(rowCnt!=1)
                throw new Exception("modify failed");

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/cs/question/list";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute(questionDto);
            rattr.addFlashAttribute("msg", "MOD_ERR");
            System.out.println("questionDto = " + questionDto);
            return "cs/question";
        }
    }

    @PostMapping("/write")
    public String write(QuestionDto questionDto, RedirectAttributes rattr) {
        try {
            int rowCnt = questionService.write(questionDto);
            if(rowCnt!=1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/cs/question/list";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "WRT_ERR");
            return "cs/question";
        }
    }

    @GetMapping("/write")
    public String write(HttpSession session, Model m) {
        int memberId = (Integer) session.getAttribute("memberId");
        System.out.println("memberId = " + memberId);
        m.addAttribute("mode", "new");
        return "cs/question"; // 읽기와 쓰기 모두 사용
    }

    @PostMapping("/delete")
    public String remove(Integer question_id, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr) {
        int memberId = (Integer) session.getAttribute("memberId");

        try {
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);

            int rowCnt = questionService.delete(question_id, memberId);

            if(rowCnt==1){
                rattr.addFlashAttribute("msg", "DEL_OK");
                return "redirect:/cs/question/list";
            }

            if(rowCnt!=1){
                throw new Exception("question remove error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }

        return "redirect:/cs/questionList";
    }

    @GetMapping("/read")
    public String read(int question_id, Integer page, Integer pageSize, Model m) {
        try {
            QuestionDto questionDto = questionService.read(question_id);
            AnswerDto answerDto = answerService.getAnswer(question_id);

            m.addAttribute(questionDto);
            if(answerDto != null)
                m.addAttribute(answerDto);

            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "cs/question";
    }

    @GetMapping("/list")
    public String list(SearchCondition sc, Model m, HttpServletRequest request) {
        try {
            int totalCnt = questionService.getSearchResultCnt(sc);
            m.addAttribute("totalCnt", totalCnt);

            PageHandler pageHandler = new PageHandler(totalCnt, sc);

            List<QuestionDto> list = questionService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "cs/questionList";
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();

        // 2. 세션에 id가 있는지 확인, 없으면 true를 변환
        return session.getAttribute("id")!=null;
    }

}
