package com.msmaitran.onelineaday.repository;

import com.msmaitran.onelineaday.models.Useremail;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface UseremailRepository extends CrudRepository<Useremail, Long> {
    List<Useremail> findAllByUser_Username(String name);
}
