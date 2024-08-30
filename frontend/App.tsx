import React from 'react';
import {Text, View, StyleSheet, Image, FlatList} from 'react-native';


type innerMedProps = {
    name: string;
    image: string;
    time?: Date;
  };

const MedInnerRow = (props: innerMedProps) => {
  return (
    <View style={styles.medrow}>
      <Image source={{uri: 'https://reactjs.org/logo-og.png'}}
       style={{width: 40, height: 40}} />
      <Text>Hello {props.name} {props.image}!</Text>
      <Text> {props.name} </Text>
      </View>
  );
};

type medProps = {
  name: string;
  image: string;
  time?: Date;
  info?: string;
};

const MedRow = (props: medProps) => {
  if (props.info == null) {
    return (
      <MedInnerRow name = {props.name} image = {props.image} />
    )
  } else {
    return (
      // <Text> Yippee </Text>
      <View>
        <View style={styles.medrow}>
          <Image source={{uri: 'https://reactjs.org/logo-og.png'}}
          style={{width: 40, height: 40}} />
          <Text>Hello {props.name} {props.image}!</Text>
          <Text> {props.name} </Text>
        </View>
        <View style={styles.center}>
          <Text> {props.info} </Text>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 22,
  },
  item: {
    padding: 10,
    fontSize: 18,
    height: 44,
  },
  medrow: {
    flexDirection: 'row',
    alignItems: 'stretch',
    padding: 10,
    justifyContent: 'space-between',
  },
  center: {
    alignItems: 'center',
    backgroundColor: '#00BBB0',
    borderColor: '#000000',
    borderWidth: 1,
  },
});

const FlatListBasics = () => {
  return (
    <View style={styles.container}>
      <FlatList
        data={[
          {key: 'Devin', surname: 'love'},
          {key: 'Dan', surname: 'love'},
          {key: 'Dominic', surname: 'love', info: 'aaaaa'},
          {key: 'Jackson', surname: 'love'},
          {key: 'James', surname: 'love'},
          {key: 'Joel', surname: 'love', info: 'aaaaaaaaaaa'},
          {key: 'John', surname: 'love'},
          {key: 'Jillian', surname: 'love'},
          {key: 'Jimmy', surname: 'love'},
          {key: 'Julie', surname: 'love'},
        ]}

        renderItem={({item}) => <MedRow name = {item.key} image = {item.surname} info = {(item.info)} />}
        
        // renderItem={({item}) => <Text style={styles.item}>{item.key} {item.surname}</Text>}
      />
    </View>
  );
};

const DateDisplay = () => {
  const today = new Date()
  return (
  <View>
  <Text> {today.toLocaleDateString("en-GB", 
          { weekday: 'long',  day: 'numeric', month: 'long' }
    )}</Text>
    </View>
  );
};


const App = () => {
  return(
  <View
      style={[
        styles.container,
        {
          // Try setting `flexDirection` to `"row"`.
          flexDirection: 'column',
        },
      ]}>
    <DateDisplay></DateDisplay>
    <FlatListBasics></FlatListBasics>
  </View>
  )
};


// export default FlatListBasics;
export default App;