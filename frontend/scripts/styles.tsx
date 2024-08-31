import {StyleSheet} from 'react-native';

const styles = StyleSheet.create({
    container: {
      flex: 1,
      padding: 10,
      backgroundColor: '#558B70',
    },
    card: {
      flexDirection: 'row',
      alignItems: 'center',
      justifyContent: 'space-between',
      backgroundColor: '#CADDE0',
      borderTopRightRadius: 12,
      borderTopLeftRadius: 12,
      padding: 10,
      shadowOpacity: 0.2,
      shadowRadius: 12,
      elevation: 3,
    },
    image: {
      width: 50,
      height: 50,
      borderRadius: 25,
      marginRight: 15,
    },
    textContainer: {
      backgroundColor:'#99BFC6',
      borderBottomStartRadius: 12,
      borderBottomEndRadius: 12,
      flex: 1,
      justifyContent: 'center',
    },
    nameText: {
      fontSize: 18,
      fontWeight: 'bold',
      color: '#333',
    },
    infoText: {
      fontSize: 14,
      color: '#666',
      marginTop: 5,
      textAlign: 'center'
    },
    separator: {
      height: 10,
    },
  });

  export default styles;