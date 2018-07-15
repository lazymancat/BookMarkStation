package com.ljm.web.controller;

import com.ljm.web.model.Collect;
import com.ljm.web.service.CollectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@Controller
public class CollectController {
    @Resource
    private CollectService collectService;

    /**
     * 检查书签被该用户收藏
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/Collect_checkBookMarkMarked"})
    public void checkBookMarkMarked(HttpServletRequest req,
        HttpServletResponse res, HttpSession session) {
        int bookmarkID = Integer.parseInt(req.getParameter("bookmarkID"));
        int userID = Integer.parseInt(req.getParameter("userID"));

        Collect result = collectService.checkBookMarkMarked(userID, bookmarkID);

        String json = (result != null) ? "{\"result\":true}"
                                       : "{\"result\":false}";

        try {
            res.setCharacterEncoding("utf-8");
            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 新增书签收藏关系
     * @param req
     * @param res
     * @param session
     */
    @RequestMapping({"/Collect_addCollect"})
    public void addCollect(HttpServletRequest req, HttpServletResponse res,
        HttpSession session) {
        int bookmarkID = Integer.parseInt(req.getParameter("bookmarkID"));
        int userID = Integer.parseInt(req.getParameter("userID"));

        boolean result = collectService.addCollect(userID, bookmarkID);

        String json = "{\"result\":" + result + "}";

        try {
            res.setCharacterEncoding("utf-8");
            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除书签收藏关系
     * @param req
     * @param res
     * @param model
     * @param session
     */
    @RequestMapping({"/Collect_deleteCollect"})
    public void deleteCollect(HttpServletRequest req, HttpServletResponse res,
        Model model, HttpSession session) {
        int bookmarkID = Integer.parseInt(req.getParameter("bookmarkID"));
        int userID = Integer.parseInt(req.getParameter("userID"));

        boolean result = collectService.deleteCollect(userID, bookmarkID);

        String json = "{\"result\":" + result + "}";

        try {
            res.setCharacterEncoding("utf-8");
            res.setContentType("text/json");

            res.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
