package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.Prenda;

public interface IPrendaRepository extends JpaRepository<Prenda, Integer>{
	@Query("from Prenda p where p.nombre like %:nombre%")
}
