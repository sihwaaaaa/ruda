package co.poetrypainting.ruda.service.test;

public interface KakaoLoginServiceImpl {
    String getAccessToken(String authorize_code) throws Throwable;
}
