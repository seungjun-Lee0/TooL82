package tool82.spring.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import tool82.spring.project.service.SaleService;
import tool82.spring.project.vo.Product;

@Controller
public class SaleController {

    @Autowired
    private SaleService ssrv;

    @GetMapping("/seller/write")
    public String sellReg(){
        return "seller/write.tiles";
    }

    // with img
    @PostMapping("/seller/write")
    public String sellRegOk(Product p, MultipartFile[] img) {
        String returnPage = "redirect:/game/list";
        System.out.println("111" + img);
        ssrv.newSale(p, img);
        return returnPage;
    }

    @GetMapping("/seller/update")
    public ModelAndView updateSell(ModelAndView mv, String pno)
    {
        mv.setViewName("seller/update.tiles");
        mv.addObject("pd", ssrv.readOneProd(pno));
        System.out.println(pno + "아아아");
        return mv;
    }

    @PostMapping("/seller/update")
    public String updateSellOk(Product p, MultipartFile[] img, String todie)
    {
        ssrv.modifySaleItem(p, img);
        return "redirect:/";
    }





    // without img
//    @PostMapping("/seller/write")
//    public String sellRegok(Product p) {
//        String returnPage = "redirect:/game/list";
//
//        if (ssrv.newSale(p))
//            System.out.println("입력완료!");
//
//        return returnPage;
//    }



}
