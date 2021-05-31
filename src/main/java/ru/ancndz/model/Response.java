package ru.ancndz.model;

/**
 * Модель ответа сервера.
 */
public class Response {
    /**
     * Статус.
     */
    private String status;

    /**
     * Объект.
     */
    private Object data;

    public Response() {
    }

    public Response(String status, Object data) {
        this.status = status;
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
