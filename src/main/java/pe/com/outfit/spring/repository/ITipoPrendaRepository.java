package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.TipoPrenda;

public interface ITipoPrendaRepository extends JpaRepository<TipoPrenda, Integer>{
	@Query("from TipoPrenda ti where ti.nombre like %:nombre%")
}
