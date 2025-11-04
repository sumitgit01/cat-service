package com.cat_service.controller;

import com.cat_service.model.Cat;
import com.cat_service.repository.CatRepository;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/cats/")
@CrossOrigin(origins = "http://localhost:3000") // allow frontend access
public class CatController {

    private final CatRepository catRepository;

    public CatController(CatRepository catRepository) {
        this.catRepository = catRepository;
    }

    @PostMapping
    public Cat addCat(@RequestBody Cat cat) {
        return catRepository.save(cat);
    }

    @GetMapping("getcats")
    public List<Cat> getAllCats() {
        return catRepository.findAll();
    }

    @GetMapping("/{id}")
    public Cat getCatById(@PathVariable Long id) {
        return catRepository.findById(id).orElse(null);
    }
}
