package co.poetrypainting.ruda.service;

public interface KakaoLoginServiceImpl {
    String getAccessToken(String authorize_code) throws Throwable;
}
