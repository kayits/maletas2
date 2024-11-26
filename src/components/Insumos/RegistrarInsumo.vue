<template>
    <section>
        <p class="title is-1 has-text-weight-bold">Registrar Paquete</p>
        <b-breadcrumb align="is-left" >
            <b-breadcrumb-item tag='router-link' to="/">Inicio</b-breadcrumb-item>
            <b-breadcrumb-item tag='router-link' to="/insumos">Paquetes</b-breadcrumb-item>
        </b-breadcrumb>
        <b-loading :is-full-page="true" v-model="cargando" :can-cancel="false"></b-loading>
        <datos-insumo @registrado="onRegistrado" :insumo="insumo"></datos-insumo>
    </section>
</template>
<script>
import DatosInsumo from "./DatosInsumo.vue"
import HttpService from '../../Servicios/HttpService'

export default {
    name: "RegistrarInsumo",
    components: { DatosInsumo },

    data: () => ({
        cargando: false,
        insumo: {
            tipo: "",
            codigo: "",
            nombre: "",
            descripcion: "",
            categoria: "",
            precio: "",
            atendio: localStorage.getItem("nombreUsuario")
        }
    }),

    
    methods: {
        onRegistrado(registro) {
            this.insumo = registro
            this.cargando = true
            HttpService.registrar(this.insumo, "registrar_insumo.php")
            .then(registrado => {
                if(registrado) {
                    this.insumo = {
                        tipo: "",
                        codigo: "",
                        nombre: "",
                        descripcion: "",
                        categoria: "",
                        precio: "",
                        atendio: localStorage.getItem("nombreUsuario"),
                    }
                    this.$buefy.toast.open({
                        message: 'Paquete registrado',
                        type: 'is-success'
                    })
                    this.cargando = false
                }
            })
        }
    },
    obtenerDatos(){
            HttpService.obtener("obtener_datos_local.php")
            .then(resultado => {
                this.datosLocal = resultado
                
            })
        },

}
</script>