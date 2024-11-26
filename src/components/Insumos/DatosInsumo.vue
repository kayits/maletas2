<template>
    <section>
        <ul v-if="errores.length > 0">
            <li class="has-text-danger has-text-centered" v-for="error in errores" :key="error">{{ error }}</li>
        </ul>
        <b-field label="Tipo" >
            <b-select  v-model="insumo.tipo" @change.native="obtenerCategorias">
                <option value="" disabled selected>Selecciona el tipo de paquete</option>
                <option value="Encomienda">
                    Encomienda
                </option>
                <option value="Correo/En Linea">
                    Correo/En Linea
                </option>
            </b-select>
        </b-field>

        <b-field label="Código" >
            <b-input type="text" placeholder="Código identificador del paquete" v-model="insumo.codigo"></b-input>
        </b-field>

        <b-field label="Nombre" >
            <b-input type="text" placeholder="Nombre del paquete" v-model="insumo.nombre"></b-input>
        </b-field>

        <b-field label="Declaración" >
            <b-input maxlength="200" type="textarea" 
            placeholder="Declaración del paquete" v-model="insumo.descripcion"></b-input>
        </b-field>

        <b-field label="Categoría" >
            <b-select v-model="insumo.categoria">
                <option value="" disabled selected>Selecciona categoria</option>
                <option v-for="categoria in categorias" :key="categoria.id" :value="categoria.id">
                    {{ categoria.nombre }}
                </option>
            </b-select>
        </b-field>

        <b-field label="Precio" hidden>
            <b-input type="number" placeholder="Precio de venta del paquete" v-model="insumo.precio"></b-input>
        </b-field>

        <div class="has-text-centered">
            <b-button type="is-success" size="is-large" icon-left="check" @click="registrar">Registrar</b-button>
        </div>
        
    </section>
</template>
<script>
import Utiles from '../../Servicios/Utiles'
import HttpService from '../../Servicios/HttpService'

export default {
    name: "DatosInsumo",
    props: ["insumo"],

    data: () => ({
        datosLocal: {},
        errores: [],
        categorias: []
    }),
        
    methods: {
        registrar() {
            let datos = {
                tipo: this.insumo.tipo,
                codigo: this.insumo.codigo,
                nombre: this.insumo.nombre,
                descripcion: this.insumo.descripcion,
            }
            this.errores = Utiles.validar(datos)
            if(this.errores.length > 0) return
            this.$emit("registrado", this.insumo)
        },
        
        obtenerCategorias() {
          
                HttpService.obtenerConDatos(this.insumo.tipo, "obtener_categorias_tipo.php")
                .then(resultado => {
                    this.categorias = resultado
                })
            
        }
    }
}
</script>