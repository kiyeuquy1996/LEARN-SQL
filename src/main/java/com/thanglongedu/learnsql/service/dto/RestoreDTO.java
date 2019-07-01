package com.thanglongedu.learnsql.service.dto;

import java.io.Serializable;
import java.util.Objects;

public class RestoreDTO implements Serializable {
    private String restore;

    public String getRestore() {
        return restore;
    }

    public void setRestore(String restore) {
        this.restore = restore;
    }

    @Override
    public String toString() {
        return "restoreDTO{" +
            "restore='" + restore + '\'' +
            '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        TryItQueryDTO categoryDTO = (TryItQueryDTO) o;
        if (categoryDTO.getQuery() == null || getRestore() == null) {
            return false;
        }
        return Objects.equals(getRestore(), categoryDTO.getQuery());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getRestore());
    }

    public RestoreDTO(String restore) {
        this.restore = restore;
    }

    public RestoreDTO() {
    }
}

