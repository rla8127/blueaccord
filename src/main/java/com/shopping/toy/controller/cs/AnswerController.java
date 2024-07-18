package com.shopping.toy.controller.cs;

import com.shopping.toy.domain.cs.AnswerDto;
import com.shopping.toy.service.cs.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/cs/answer")
public class AnswerController {
    @Autowired
    AnswerService answerService;

    @PostMapping("/write")
    public String insert(AnswerDto answerDto, Model m){
        try {
            System.out.println("answerService = " + answerService);
            answerService.insert(answerDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/cs/question/list";
    }

    @PostMapping("/modify")
    public String modify(Integer page, Integer pageSize, AnswerDto answerDto, Model m, RedirectAttributes rattr) {
        try {
            rattr.addAttribute("page", page);
            rattr.addAttribute("pageSize", pageSize);
            int rowCnt = answerService.modify(answerDto);

            if(rowCnt!=1)
                throw new Exception("modify failed");

            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/cs/question/list";

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute(answerDto);
            rattr.addFlashAttribute("msg", "MOD_ERR");
            System.out.println("questionDto = " + answerDto);
            return "cs/question";
        }
    }

    @PostMapping("/delete")
    public String remove(int answer_id, int question_id, Integer page, Integer pageSize, Model m, RedirectAttributes rattr) {
        try {
            m.addAttribute("page", page);
            m.addAttribute("pageSize", pageSize);
            answerService.delete(answer_id, question_id);

        } catch (Exception e) {
            e.printStackTrace();
            rattr.addFlashAttribute("msg", "DEL_ERR");
        }
        return "redirect:/cs/question/list";
    }
}
