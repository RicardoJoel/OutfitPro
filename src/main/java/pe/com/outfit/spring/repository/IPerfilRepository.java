package pe.com.outfit.spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import pe.com.outfit.spring.model.Perfil;

public interface IPerfilRepository extends JpaRepository<Perfil, Integer>{
	@Query("from Perfil order by Perfil.nivelAcceso ASC")
}
