package co.poetrypainting.ruda.domain.member;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum Role {
    USER("ROLE_USER", "user"),
    ADMIN("ROLE_ADMIN", "admin");

    private final String key;
    private final String title;
}
