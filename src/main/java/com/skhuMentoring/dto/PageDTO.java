package com.skhuMentoring.dto;

import lombok.Data;

@Data
public class PageDTO {
    private int startPage;
    private int endPage;
    private boolean prev , next;
    private int realEnd;
    private Criteria cri;
    private Long total;

    public PageDTO(Criteria cri, Long total) {
        this.cri = cri;
        this.total = total;

        this.endPage = (int) Math.ceil(cri.getPageNum() / 10.0) * cri.getAmount();
        this.startPage = endPage - 9;
        this.realEnd = (int)Math.ceil(total / 10.0);
        this.endPage = endPage > realEnd ? realEnd : endPage;

        this.prev = startPage >1;
        this.next = endPage != realEnd;
    }

}
