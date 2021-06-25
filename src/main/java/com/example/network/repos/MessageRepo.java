package com.example.network.repos;

import com.example.network.domain.Message;
import com.example.network.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.math.BigInteger;
import java.util.List;

public interface MessageRepo extends CrudRepository<Message, Long> {

    List<Message> findByTag(String tag);

    List<Message> findByAuthor(User author);


}
