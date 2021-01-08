package mv.webyonhu;

import mv.beanguanli.FanKui;
import mv.beanyonhu.Pinlunyy;
import mv.daoguanli.LookDao;
import mv.daoyonhu.YonhuZhuyeiDao;
import mv.vo.ResultVO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/yypl")
public class KanYinyuePinlun extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        YonhuZhuyeiDao yonhuZhuyeiDao = new YonhuZhuyeiDao();
        try {
            int currentPage, pageSize;

            try {
                currentPage = Integer.parseInt(req.getParameter("curr"));
            } catch (Exception e) {
                currentPage = 1;
            }

            try {
                pageSize = Integer.parseInt(req.getParameter("size"));
            } catch (Exception e) {
                pageSize = 10;
            }

            String mid = req.getParameter("mid");
            int mid2 = Integer.parseInt(mid);
            List<Pinlunyy> pinlunyys = yonhuZhuyeiDao.pinlunyys(mid2, currentPage, pageSize);
            int total = yonhuZhuyeiDao.getplMount(mid2);

            PrintWriter writer = resp.getWriter();
            writer.print(ResultVO.ok(pinlunyys).setPage(currentPage, pageSize, total).toJSON());
        } catch (Exception e) {
            e.printStackTrace();
            PrintWriter writer = resp.getWriter();
            writer.print(ResultVO.err(114, e.getLocalizedMessage()).toJSON());
        }

    }


}
