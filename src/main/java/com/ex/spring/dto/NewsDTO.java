package com.ex.spring.dto;

public class NewsDTO extends AbstractDTO<NewsDTO> {

    private Long id;
    private String title;
    private String exportThumbnail;
    private String shortDescription;
    private String content;
    private CategoryDTO category;

    public CategoryDTO getCategory() {
        return category;
    }

    public void setCategory(CategoryDTO category) {
        this.category = category;
    }

    public String getExportThumbnail() {
        return exportThumbnail;
    }

    public void setExportThumbnail(String exportThumbnail) {
        this.exportThumbnail = exportThumbnail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
